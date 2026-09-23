from fastapi.responses import JSONResponse
from fastapi import Request
from features.product.exception import ProductNotFoundError, NotEnoughStockError


async def product_not_found_handler(request: Request, exc: ProductNotFoundError):
    return JSONResponse(status_code=404, content={"detail": "product not found"})


async def not_enough_stock_handler(request: Request, exc: NotEnoughStockError):
    return JSONResponse(status_code=400, content={"detail": "not enough stock"})
