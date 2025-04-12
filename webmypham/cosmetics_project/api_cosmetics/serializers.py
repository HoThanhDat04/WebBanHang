from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Address, Category, Brand, Product, ProductVariant, ProductImage, Cart, CartItem, Wishlist, Order, OrderItem

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'first_name', 'last_name', 'password']
        extra_kwargs = {
            'password': {'write_only': True, 'required': False}  # Không bắt buộc khi cập nhật
        }

    def create(self, validated_data):
        # Đảm bảo password được cung cấp khi tạo mới
        if 'password' not in validated_data:
            raise serializers.ValidationError({"password": "This field is required when creating a user."})
        user = User.objects.create_user(**validated_data)
        return user

    def update(self, instance, validated_data):
        # Xử lý cập nhật thông tin người dùng
        password = validated_data.pop('password', None)  # Lấy password nếu có, nếu không thì bỏ qua
        for attr, value in validated_data.items():
            setattr(instance, attr, value)
        if password:
            instance.set_password(password)  # Cập nhật mật khẩu nếu được cung cấp
        instance.save()
        return instance

class AddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = Address
        fields = ['id', 'user', 'address_line', 'city', 'postal_code', 'country', 'is_default']

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name', 'parent']

class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = ['id', 'name']

class ProductVariantSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductVariant
        fields = ['id', 'product', 'color', 'size', 'additional_price', 'stock']

class ProductImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductImage
        fields = ['id', 'product', 'image_url', 'is_primary']

class ProductSerializer(serializers.ModelSerializer):
    category = CategorySerializer(read_only=True)
    brand = BrandSerializer(read_only=True)
    variants = ProductVariantSerializer(many=True, read_only=True, source='productvariant_set')
    images = ProductImageSerializer(many=True, read_only=True, source='productimage_set')

    class Meta:
        model = Product
        fields = ['id', 'name', 'description', 'price', 'stock', 'category', 'brand', 'variants', 'images', 'created_at', 'updated_at']

class CartItemSerializer(serializers.ModelSerializer):
    product = ProductSerializer(read_only=True)  # Trả về chi tiết sản phẩm
    variant = ProductVariantSerializer(read_only=True)  # Trả về chi tiết biến thể (nếu có)

    class Meta:
        model = CartItem
        fields = ['id', 'cart', 'product', 'variant', 'quantity']

    def validate(self, data):
        product = data.get('product')
        variant = data.get('variant')
        if variant and variant.product != product:
            raise serializers.ValidationError("Biến thể không thuộc về sản phẩm này.")
        return data

class CartSerializer(serializers.ModelSerializer):
    items = CartItemSerializer(many=True, read_only=True, source='cartitem_set')

    class Meta:
        model = Cart
        fields = ['id', 'user', 'session_id', 'created_at', 'items']

class WishlistSerializer(serializers.ModelSerializer):
    product = serializers.PrimaryKeyRelatedField(queryset=Product.objects.all())  # Nhận ID của sản phẩm
    product_detail = ProductSerializer(source='product', read_only=True)  # Hiển thị chi tiết sản phẩm khi trả về

    class Meta:
        model = Wishlist
        fields = ['id', 'user', 'product', 'product_detail', 'added_at']

class OrderItemSerializer(serializers.ModelSerializer):
    variant = ProductVariantSerializer(read_only=True)

    class Meta:
        model = OrderItem
        fields = ['id', 'order', 'variant', 'quantity', 'price_at_time']

class OrderSerializer(serializers.ModelSerializer):
    address = serializers.PrimaryKeyRelatedField(queryset=Address.objects.all())  # Nhận ID của địa chỉ
    address_detail = AddressSerializer(source='address', read_only=True)  # Hiển thị chi tiết địa chỉ khi trả về
    items = OrderItemSerializer(many=True, read_only=True, source='orderitem_set')

    class Meta:
        model = Order
        fields = ['id', 'user', 'address', 'address_detail', 'total_amount', 'status', 'payment_method', 'created_at', 'updated_at', 'items']