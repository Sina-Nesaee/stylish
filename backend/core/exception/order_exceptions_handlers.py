from fastapi.responses import JSONResponse
from fastapi import Request
from features.order.exception import (
    OrderNotFoundError,
    OrderAlreadyCancelledError,
    OrderAlreadyPaidError,
    OrderCannotBeCancelledError,
    OrderCannotBePaidError,
    OrderCannotBeShippedError,
)


async def order_not_found_handler(request: Request, exc: OrderNotFoundError):
    return JSONResponse(status_code=404, content={"detail": "order not found"})


async def order_already_cancelled_handler(
    request: Request, exc: OrderAlreadyCancelledError
):
    return JSONResponse(status_code=400, content={"detail": "order Already cancelled"})


async def order_already_paid_error(request: Request, exc: OrderAlreadyPaidError):
    return JSONResponse(status_code=400, content={"detail": "order already paid"})


async def order_cannot_be_cancelled_error(
    request: Request, exc: OrderCannotBeCancelledError
):
    return JSONResponse(
        status_code=400, content={"detail": "Order Cannot be Cancelled"}
    )


async def order_cannot_be_paid_error(request: Request, exc: OrderCannotBePaidError):
    return JSONResponse(status_code=400, content={"detail": "order cannot be paid"})


async def order_cannot_be_shipped_error(
    request: Request, exc: OrderCannotBeShippedError
):
    return JSONResponse(status_code=400, content={"detail": "order cannot be shipped"})
