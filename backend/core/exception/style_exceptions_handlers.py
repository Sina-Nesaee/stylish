from features.style.exception import StyleNotFound
from fastapi.responses import JSONResponse
from fastapi import Request


def style_not_found_handler(request: Request, exc: StyleNotFound):
    return JSONResponse(status_code=404, content={"detail": "style not founded"})
