package com.haoyu.exception;

public class SysMineException extends RuntimeException {
    public SysMineException() {
        super();
    }

    public SysMineException(String message) {
        super(message);
    }

    public SysMineException(String message, Throwable cause) {
        super(message, cause);
    }

    public SysMineException(Throwable cause) {
        super(cause);
    }

    protected SysMineException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
