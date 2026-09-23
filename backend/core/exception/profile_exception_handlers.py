from features.profile.exception import ProfileNotFound
from fastapi.responses import JSONResponse
from fastapi import Request


def profile_not_found_handler(request: Request, exc: ProfileNotFound):
    return JSONResponse(status_code=404, content={"detail": "profile not found"})
