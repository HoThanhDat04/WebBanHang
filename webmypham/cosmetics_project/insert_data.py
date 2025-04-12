import os
import django

# Cấu hình để sử dụng Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cosmetics_project.settings')
django.setup()

from api_cosmetics.models import Category, Brand, Product, ProductVariant, ProductImage

# Chèn dữ liệu vào bảng Category
def insert_categories():
    categories = [
        {"name": "Son môi", "parent": None},
        {"name": "Son lì", "parent": 1},
        {"name": "Son bóng", "parent": 1},
        {"name": "Kem dưỡng da", "parent": None},
        {"name": "Phấn mắt", "parent": None},
    ]
    for cat in categories:
        parent = Category.objects.filter(id=cat["parent"]).first() if cat["parent"] else None
        Category.objects.get_or_create(name=cat["name"], parent=parent)

# Chèn dữ liệu vào bảng Brand
def insert_brands():
    brands = [
        {"name": "MAC"},
        {"name": "Chanel"},
        {"name": "Maybelline"},
    ]
    for brand in brands:
        Brand.objects.get_or_create(name=brand["name"])

# Chèn dữ liệu vào bảng Product
def insert_products():
    products = [
        {
            "name": "Son MAC Ruby Woo",
            "description": "Son lì màu đỏ cổ điển, lâu trôi, phù hợp mọi loại da.",
            "price": 500000,
            "stock": 100,
            "category": Category.objects.get(name="Son lì"),
            "brand": Brand.objects.get(name="MAC"),
        },
        {
            "name": "Kem dưỡng Chanel Hydra Beauty",
            "description": "Kem dưỡng ẩm cao cấp, cấp nước tức thì.",
            "price": 1500000,
            "stock": 50,
            "category": Category.objects.get(name="Kem dưỡng da"),
            "brand": Brand.objects.get(name="Chanel"),
        },
        {
            "name": "Phấn mắt Maybelline Nudes",
            "description": "Bảng phấn mắt 12 màu, dễ phối màu.",
            "price": 300000,
            "stock": 80,
            "category": Category.objects.get(name="Phấn mắt"),
            "brand": Brand.objects.get(name="Maybelline"),
        },
    ]
    for product in products:
        Product.objects.get_or_create(
            name=product["name"],
            description=product["description"],
            price=product["price"],
            stock=product["stock"],
            category=product["category"],
            brand=product["brand"],
        )

# Chèn dữ liệu vào bảng ProductVariant
def insert_product_variants():
    variants = [
        {
            "product": Product.objects.get(name="Son MAC Ruby Woo"),
            "color": "Đỏ Ruby",
            "size": "3g",
            "additional_price": 0,
            "stock": 50,
        },
        {
            "product": Product.objects.get(name="Son MAC Ruby Woo"),
            "color": "Đỏ Cam",
            "size": "3g",
            "additional_price": 0,
            "stock": 50,
        },
        {
            "product": Product.objects.get(name="Kem dưỡng Chanel Hydra Beauty"),
            "color": None,
            "size": "50ml",
            "additional_price": 0,
            "stock": 50,
        },
    ]
    for variant in variants:
        ProductVariant.objects.get_or_create(
            product=variant["product"],
            color=variant["color"] if variant["color"] else "",
            size=variant["size"] if variant["size"] else "",
            additional_price=variant["additional_price"],
            stock=variant["stock"],
        )

# Chèn dữ liệu vào bảng ProductImage
def insert_product_images():
    images = [
        {
            "product": Product.objects.get(name="Son MAC Ruby Woo"),
            "image_url": "https://example.com/images/mac_ruby_woo.jpg",
            "is_primary": True,
        },
        {
            "product": Product.objects.get(name="Kem dưỡng Chanel Hydra Beauty"),
            "image_url": "https://example.com/images/chanel_hydra_beauty.jpg",
            "is_primary": True,
        },
        {
            "product": Product.objects.get(name="Phấn mắt Maybelline Nudes"),
            "image_url": "https://example.com/images/maybelline_nudes.jpg",
            "is_primary": True,
        },
    ]
    for image in images:
        ProductImage.objects.get_or_create(
            product=image["product"],
            image_url=image["image_url"],
            is_primary=image["is_primary"],
        )

# Chạy các hàm để chèn dữ liệu
if __name__ == "__main__":
    print("Inserting categories...")
    insert_categories()
    print("Inserting brands...")
    insert_brands()
    print("Inserting products...")
    insert_products()
    print("Inserting product variants...")
    insert_product_variants()
    print("Inserting product images...")
    insert_product_images()
    print("Data insertion completed!")