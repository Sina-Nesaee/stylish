from features.category.exception import CategoryNotFound
from fastapi import Request
from fastapi.responses import JSONResponse


async def category_not_found_handler(request: Request, exc: CategoryNotFound):
    return JSONResponse(status_code=404, content={"detail": "category not founded"})
