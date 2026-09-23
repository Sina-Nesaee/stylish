from features.address.exception import AddressNotFound
from fastapi import Request
from fastapi.responses import JSONResponse


def address_not_found_handler(request: Request, exc: AddressNotFound):
    return JSONResponse(status_code=404, content={"detail": "address not found"})
