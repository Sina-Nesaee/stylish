from .style_router import router as style_router
from fastapi import APIRouter

router = APIRouter(prefix="/style", tags=["style"])
router.include_router(style_router)
