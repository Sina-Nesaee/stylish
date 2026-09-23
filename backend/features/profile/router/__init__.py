from fastapi import APIRouter
from .profile_router import router as profile_router

router = APIRouter(prefix="/profile", tags=["profile"])
router.include_router(profile_router)
