from fastapi import APIRouter
from .brand_router import router as brand_router

router = APIRouter(prefix="/brand", tags=["brand"])
router.include_router(brand_router)
