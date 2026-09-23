from fastapi import APIRouter
from .user_router import router as user_router

router = APIRouter(prefix="/user", tags=["user"])
router.include_router(user_router)
