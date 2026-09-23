from fastapi import FastAPI, Request
from core.database import engine, Base
from features.product.exception import ProductNotFoundError, NotEnoughStockError
from features.order.exception import (
    OrderNotFoundError,
    OrderAlreadyCancelledError,
    OrderAlreadyPaidError,
    OrderCannotBeCancelledError,
    OrderCannotBePaidError,
    OrderCannotBeShippedError,
)
from features.brand.exception import BrandNotFound
from features.category.exception import CategoryNotFound
from features.profile.exception import ProfileNotFound
from features.style.exception import StyleNotFound
from features.address.exception import AddressNotFound
from features.user.exception import UserNotFound
from features.bank_accounts.exceptions import BankAccountsNotFound

from features.product.router import router as product_router
from features.order.router import router as order_router
from features.category.router import router as category_router
from features.brand.router import router as brand_router
from features.style.router import router as style_router
from features.profile.router import router as profile_router
from features.address.router import router as adress_router
from features.user.router import router as user_router
from features.bank_accounts.router import router as bank_accounts_router
from features.auth.router import router as auth_router
from core.exception import (
    product_not_found_handler,
    not_enough_stock_handler,
    order_not_found_handler,
    order_already_cancelled_handler,
    order_already_paid_error,
    order_cannot_be_cancelled_error,
    order_cannot_be_paid_error,
    order_cannot_be_shipped_error,
    category_not_found_handler,
    brand_not_found_handlers,
    style_not_found_handler,
    profile_not_found_handler,
    address_not_found_handler,
    user_exceptions_handlers,
    bank_accounts_exception_handlers,
)
from core import models

tags_metadata = [
    {
        "name": "users",
        "description": "Operations with users. The **login** logic is also here.",
    },
    {
        "name": "items",
        "description": "Manage items. So _fancy_ they have their own docs.",
        "externalDocs": {
            "description": "Items external docs",
            "url": "https://fastapi.tiangolo.com/",
        },
    },
]


app = FastAPI(
    contact={
        "name": "sina",
        "url": "http://x-force.example.com/contact/",
        "email": "dp@x-force.example.com",
    },
    redoc_url="/redocumentation",
    openapi_tags=tags_metadata,
    title="Stylish App",
    summary="Deadpond's favorite app. Nuff said.",
    description="""
                ChimichangApp API helps you do awesome stuff. 🚀

                ## Items

                You can **read items**.

                ## Users

                You will be able to:

                * **Create users** (_not implemented_).
                * **Read users** (_not implemented_).

                """,
)
app.include_router(product_router)
app.include_router(order_router)
app.include_router(category_router)
app.include_router(brand_router)
app.include_router(style_router)
app.include_router(profile_router)
app.include_router(adress_router)
app.include_router(user_router)
app.include_router(bank_accounts_router)
app.include_router(auth_router)


app.add_exception_handler(ProductNotFoundError, product_not_found_handler)
app.add_exception_handler(NotEnoughStockError, not_enough_stock_handler)
app.add_exception_handler(OrderNotFoundError, order_not_found_handler)
app.add_exception_handler(OrderAlreadyCancelledError, order_already_cancelled_handler)
app.add_exception_handler(OrderAlreadyPaidError, order_already_paid_error)
app.add_exception_handler(OrderCannotBeCancelledError, order_cannot_be_cancelled_error)
app.add_exception_handler(OrderCannotBePaidError, order_cannot_be_paid_error)
app.add_exception_handler(OrderCannotBeShippedError, order_cannot_be_shipped_error)
app.add_exception_handler(CategoryNotFound, category_not_found_handler)
app.add_exception_handler(BrandNotFound, brand_not_found_handlers)
app.add_exception_handler(StyleNotFound, style_not_found_handler)
app.add_exception_handler(ProfileNotFound, profile_not_found_handler)
app.add_exception_handler(AddressNotFound, address_not_found_handler)
app.add_exception_handler(UserNotFound, user_exceptions_handlers)
app.add_exception_handler(BankAccountsNotFound, bank_accounts_exception_handlers)
