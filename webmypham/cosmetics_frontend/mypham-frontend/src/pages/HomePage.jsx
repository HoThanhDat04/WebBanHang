import React, { useEffect, useState } from 'react';
import axiosInstance from '../axiosConfig';
import { useSearch } from '../context/SearchContext';
import ProductSection from '../components/ProductSection/ProductSection';

const HomePage = () => {
  const { searchQuery } = useSearch();
  const [products, setProducts] = useState([]);
  const [filteredProducts, setFilteredProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchProducts = async () => {
      try {
        const response = await axiosInstance.get('products/');
        const allProducts = response.data;
        const sortedProducts = allProducts.sort(
          (a, b) => new Date(b.created_at) - new Date(a.created_at)
        );
        setProducts(sortedProducts);
        setFilteredProducts(sortedProducts);
      } catch (err) {
        console.error('Lỗi khi gọi API:', err);
        setError('Không thể tải sản phẩm. Vui lòng thử lại sau.');
      } finally {
        setLoading(false);
      }
    };
    fetchProducts();
  }, []);

  useEffect(() => {
    if (searchQuery) {
      const filtered = products.filter((product) =>
        product.name.toLowerCase().includes(searchQuery.toLowerCase())
      );
      setFilteredProducts(filtered);
    } else {
      setFilteredProducts(products);
    }
  }, [searchQuery, products]);

  const handleAddToCart = async (productId, variantId = null) => {
    try {
      // 1. Kiểm tra giỏ hàng
      const cartResponse = await axiosInstance.get('cart/');
      let cartId;
  
      if (cartResponse.data.length === 0) {
        const newCartResponse = await axiosInstance.post('cart/', {});
        cartId = newCartResponse.data.id;
      } else {
        cartId = cartResponse.data[0].id;
      }
  
      // 2. Chuẩn bị dữ liệu cho CartItem
      const cartItemData = {
        cart: cartId,
        product: productId,
        quantity: 1,
      };
      if (variantId) {
        cartItemData.variant = variantId;
      }
  
      // 3. Thêm vào giỏ hàng
      await axiosInstance.post('cart-items/', cartItemData);
  
      alert('Đã thêm sản phẩm vào giỏ hàng!');
    } catch (error) {
      console.error('Lỗi khi thêm vào giỏ hàng:', error.response?.data || error.message);
      alert('Không thể thêm sản phẩm vào giỏ hàng. Vui lòng thử lại.');
    }
  };
  if (loading) {
    return <div className="loading">Đang tải...</div>;
  }

  if (error) {
    return <div className="error">{error}</div>;
  }

  return (
    <div className="home-page">
      <div className="header-banner">
        <img src="./images/Mục trang chủ .png" alt="Banner Chính" />
      </div>

      <main className="main-content">
        <ProductSection
          title={searchQuery ? "Kết quả tìm kiếm" : "Tất cả sản phẩm"}
          products={filteredProducts}
          onAddToCart={handleAddToCart}
        />
        <section className="bottom-banner">
          <img src="/images/Mục trang.png" alt="VICHY Banner" />
          <img src="/images/Mục trang.png" alt="VICHY Banner" />
          <img src="/images/Mục trang.png" alt="VICHY Banner" />
        </section>
      </main>
    </div>
  );
};

export default HomePage;