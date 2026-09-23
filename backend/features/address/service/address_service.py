from ..repository import (
    get_address_repository,
    get_address_by_id_repository,
    update_address_repository,
    delete_address_repoistory,
    create_address_repository,
)
from sqlalchemy.orm import Session
from ..exception import AddressNotFound
from ..schema import AddressUpdate, AddressResponse, AddressCreate
from ..model import AdressModel


# get address
def get_address_service(db: Session):
    return get_address_repository(db)


# get address by id:
def get_address_by_id_service(db: Session, address_id: int):
    address = get_address_by_id_repository(db, address_id)
    if address is None:
        raise AddressNotFound()
    return address


# create address:
def create_address_service(db: Session, address: AddressCreate):
    address = AdressModel(
        user_id=address.user_id,
        adress=address.adress,
        city=address.city,
        state=address.state,
        country=address.country,
        pincode=address.pincode,
    )
    return create_address_repository(db, address)


# update address
def update_address_service(db: Session, user_id: int, data: AddressUpdate):
    address = get_address_by_id_repository(db, user_id)
    if address is None:
        raise AddressNotFound
    address_data = data.model_dump(exclude_unset=True)
    return update_address_repository(db, user_id, address_data)


# delete Address
def delete_address_service(db: Session, user_id):
    address = get_address_by_id_repository(db, user_id)
    if address is None:
        raise AddressNotFound
    return delete_address_repoistory(db, user_id)
