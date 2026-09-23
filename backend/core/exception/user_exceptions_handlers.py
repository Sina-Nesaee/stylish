from features.user.exception import UserNotFound
from fastapi import Request
from fastapi.responses import JSONResponse


def user_exceptions_handlers(request: Request, exc: UserNotFound):
    return JSONResponse(status_code=404, content={"detail": "user not found"})
