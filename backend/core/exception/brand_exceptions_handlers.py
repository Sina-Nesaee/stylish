from features.brand.exception import BrandNotFound
from fastapi import Request
from fastapi.responses import JSONResponse


def brand_not_found_handlers(request: Request, exc: BrandNotFound):
    return JSONResponse(status_code=404, content={"detail": "brand not founded"})
