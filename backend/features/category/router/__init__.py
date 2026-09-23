from .category_router import router as create_category_roter
from fastapi import APIRouter

router = APIRouter(prefix="/categories", tags=["category"])
router.include_router(create_category_roter)
