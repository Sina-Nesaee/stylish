from fastapi import APIRouter
from .router_product_crud import router as router_product_crud
from .router_product_queries import router as router_product_queries

router = APIRouter(prefix="/products", tags=["products"])
router.include_router(router_product_queries)
router.include_router(router_product_crud)
