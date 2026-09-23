from fastapi import APIRouter
from .adress_router import router as adress_router

router = APIRouter(prefix="/adress", tags=["adress"])
router.include_router(adress_router)
