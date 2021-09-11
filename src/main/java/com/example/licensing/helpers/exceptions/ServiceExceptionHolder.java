package com.example.licensing.helpers.exceptions;

public class ServiceExceptionHolder {

    @Getter
    @RequiredArgsConstructor
    public static class ServiceException extends RuntimeException {
        private final int code;
        private final String message;
    }

    public static class ResourceNotFoundException extends ServiceException {
        public ResourceNotFoundException(String message) {
            super(400, message);
        }
    }

    public static class ResourceAlreadyExistsException extends  ServiceException{

        public ResourceAlreadyExistsException(String message){super(400,message);}
    }

    public static class ResourceNotFoundDuringWriteRequestException extends ServiceException {
        public ResourceNotFoundDuringWriteRequestException(String message) {
            super(400, message);
        }
    }

    public static class IllegalDateFormatException extends ServiceException{
        public IllegalDateFormatException(String message) {
            super(HttpStatus.BAD_REQUEST.value(),message);
        }
    }

    public static class BadRequestException extends ServiceException{
        public BadRequestException(String message) {
            super(HttpStatus.BAD_REQUEST.value(),message);
        }
    }
}
