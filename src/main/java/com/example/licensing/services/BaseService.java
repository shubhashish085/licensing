package com.example.licensing.services;

import com.example.licensing.entities.BaseEntity;
import com.example.licensing.helpers.components.EventManagementComponent;
import com.example.licensing.helpers.exceptions.ServiceExceptionHolder;
import com.example.licensing.repositories.ServiceRepository;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.beans.BeanUtils;

import java.beans.FeatureDescriptor;
import java.lang.reflect.ParameterizedType;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@RequiredArgsConstructor
@Data
public abstract class BaseService<E extends BaseEntity, D extends IOidHolderRequestBodyDTO> {


    private final ServiceRepository<E> repository;
    private final ModelMapper modelMapper;
    private final EventManagementComponent eventManagementComponent;



    public List<D> getList() {
        return convertForRead(repository.findByIsDeleted("No"));
    }



    public  List<D> getListByOidSet(GetListByOidSetRequestBodyDTO requestDTO) {
        GetListByOidSetRequestBodyDTO body = requestDTO.getBody();
        Set<String> oids = body.getOids();

        List<E> eList = repository.findAllById(oids)
                .stream()
                .filter(e -> e.getIsDeleted().equals("No"))
                .collect(Collectors.toList());


        handleStrictness(oids, eList, body.getStrict());

        return generateResponse(requestDTO.getHeader(), convertForRead(eList));
    }

    private void handleStrictness(Set<String> oids, List<E> eList, String strict) {
        if (strict != null && strict.equals("Yes") && eList.size() < oids.size()) {
            Map<String, Boolean> oidMap = new HashMap<>();
            List<String> missingList = new ArrayList<>();

            oids.forEach(s -> oidMap.put(s, false));
            eList.forEach(e -> oidMap.put(e.getOid(), true));
            oidMap.keySet().stream().filter(s -> !oidMap.get(s)).forEach(missingList::add);

            throw new ServiceExceptionHolder.ResourceNotFoundException(
                    "No "
                            + String.join(" ", getEntityClass().getSimpleName().split("(?=\\p{Upper})"))
                            + " Found for IDs : " + String.join(",", missingList)
            );
        }
    }

    public D create(D dto) {
        E e = convertForCreate(dto);
        //e.setOid(requestDTO.getBody().getOid());
        // TODO: Remove Hard-Coded IDs
        e.setCreatedBy("System");
        e.setCreatedOn(new Date());
        e.setIsDeleted("No");
        E createdEntity = repository.save(e);

        return convertForRead(createdEntity);
    }

    public  D update(D dto) {

        String oid = dto.getOid();
        if (oid == null)
            throw new ServiceExceptionHolder
                    .ResourceNotFoundDuringWriteRequestException("No Oid Provided for " + getEntityClass().getSimpleName());
        E e = getByOidForWrite(oid);
        convertForUpdate(body, e);
        e.setUpdatedBy("System");
        e.setUpdatedOn(new Date());
        e.setIsDeleted("No");
        E updatedEntity = repository.save(e);

        return convertForRead(updatedEntity);
    }

    public D deleteByOid(OidHolderRequestBodyDTO requestDTO) {
        D d = deleteEntity(getByOidForWrite(requestDTO.getBody().getOid()));
        return d;
    }

    protected D deleteEntity(E e) {

        e.setIsDeleted("Yes");
        repository.save(e);
        return convertForRead(e);
    }

    private E getByOid(@NonNull String oid) {
        return getOptionalEntity(oid).orElseThrow(() -> new ServiceExceptionHolder.ResourceNotFoundException(
                "No " + getEntityClass().getSimpleName() + " Found with ID: " + oid));
    }

    public E getByOidForWrite(@NonNull String oid) {
        return getOptionalEntity(oid)
                .orElseThrow(() -> new ServiceExceptionHolder.ResourceNotFoundDuringWriteRequestException(
                        "No " + getEntityClass().getSimpleName() + " Found with ID: " + oid));
    }

    private Optional<E> getOptionalEntity(@NonNull String oid) {
        return repository.findByOidAndIsDeleted(oid, "No");
    }

    public D convertForRead(E e) {
        return modelMapper.map(e, getDtoClass());
    }

    protected E convertForCreate(D d) {
        E e = null;
        try {
            e = getEntityClass().newInstance();
        } catch (InstantiationException | IllegalAccessException ex) {
            ex.printStackTrace();
        }
        BeanUtils.copyProperties(d, e);
        return e;
    }

    protected E convertForUpdate(D d, E e) {
        BeanUtils.copyProperties(d, e);
        return e;
    }

    List<D> convertForRead(List<E> e) {
        return e.stream().map(this::convertForRead).collect(Collectors.toList());
    }

    @SuppressWarnings("unchecked")
    private Class<E> getEntityClass() {
        return (Class<E>) (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]);
    }

    @SuppressWarnings("unchecked")
    private Class<D> getDtoClass() {
        return (Class<D>) (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[1]);
    }

    public Set<String> validateSet(Set<String> set){
        if(set == null || set.size() == 0) {
            set.add("");
        }
        return set;
    }


}
