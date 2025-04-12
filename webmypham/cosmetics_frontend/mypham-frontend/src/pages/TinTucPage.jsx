import React from 'react';
import './TinTucPage.css'; // Tạo file CSS riêng

const TinTucPage = () => {
  // Dữ liệu tin tức mẫu
  const featuredNews = {
    title: "THAY ĐỔI LOGO NHÃN HÀNG BIODERMA",
    subtitle: "Hành trình mới với diện mạo đổi mới",
    date: "05/03/2025",
    image: "./images/Mục tin tức.png",
    content: [
      "Bioderma chính thức ra mắt logo mới với thiết kế hiện đại hơn, phản ánh tầm nhìn đổi mới trong ngành dược mỹ phẩm.",
      "Logo mới giữ nguyên tông xanh đặc trưng nhưng với đường nét mềm mại và thanh thoát hơn, thể hiện sự kết hợp giữa y học và thẩm mỹ.",
      "Đây là một phần trong chiến lược tái định vị thương hiệu toàn cầu của Bioderma trong năm 2025."
    ],
    tags: ["Bioderma", "Thương hiệu", "Đổi mới"]
  };

  const topProductsNews = {
    title: "TOP 10 DẦU GỘI CHO TÓC UỐN TỐT NHẤT 2025",
    summary: "Giữ nếp bồng bềnh, khỏe mạnh suốt ngày dài",
    date: "03/03/2025",
    image: "./images/Mục trang chủ .png",
    content: "Đây là dòng dầu gội giúp tóc uốn luôn bóng bẩy, mềm mượt và chắc khỏe. Sản phẩm phù hợp với mọi loại tóc uốn từ sóng nhẹ đến xoăn chặt, cung cấp độ ẩm cần thiết mà không làm mất nếp tóc.",
    products: [
      "Dầu gội Bioderma Nodé Fluide",
      "Dầu gội Kérastase Curl Manifesto",
      "Dầu gội Moroccanoil Curl Enhancing",
      "Dầu gội Redken All Soft Curls"
    ],
    tags: ["Chăm sóc tóc", "Tóc uốn", "Top sản phẩm"]
  };

  const skinCareArticle = {
    title: "TONER CHỐNG LÃO HÓA: BÍ QUYẾT CHO LÀN DA TƯƠI TRẺ",
    sections: [
      {
        heading: "Toner chống lão hóa là gì?",
        content: "Toner chống lão hóa là một loại nước cân bằng da được thiết kế đặc biệt để làm chậm quá trình lão hóa, giảm nếp nhăn và duy trì làn da tươi trẻ. Khác với toner thông thường, sản phẩm này chứa các thành phần chống oxy hóa mạnh như vitamin C, retinol, peptides và các chiết xuất thực vật quý."
      },
      {
        heading: "Cơ chế hoạt động",
        content: "Toner chống lão hóa hoạt động trên 3 cơ chế chính: (1) Cân bằng độ pH da, (2) Cung cấp chất chống oxy hóa trung hòa gốc tự do, (3) Tăng cường hàng rào bảo vệ da. Sản phẩm thường được dùng sau bước làm sạch và trước các sản phẩm dưỡng da khác."
      },
      {
        heading: "Cách chọn toner phù hợp",
        content: "Da khô: Chọn toner chứa hyaluronic acid, glycerin. Da dầu: Ưu tiên toner không cồn với thành phần niacinamide. Da nhạy cảm: Tìm kiếm sản phẩm không chứa cồn, hương liệu với chiết xuất từ hoa cúc, rau má."
      }
    ],
    recommended: [
      "Toner Bioderma Sensibio Tonique",
      "Toner La Roche-Posay Pure Thermal",
      "Toner Vichy Mineral 89"
    ],
    tags: ["Chống lão hóa", "Skincare", "Toner"]
  };

  const relatedNews = [
    {
      title: "Xu hướng mỹ phẩm clean beauty 2025",
      date: "28/02/2025",
      excerpt: "Cùng khám phá những xu hướng làm đẹp bền vững sẽ thống trị năm 2025"
    },
    {
      title: "Đánh giá bộ sản phẩm dưỡng trắng mới từ Lancôme",
      date: "25/02/2025",
      excerpt: "Trải nghiệm thực tế hiệu quả làm sáng da sau 4 tuần sử dụng"
    }
  ];

  return (
    <div className="tin-tuc-page">
      {/* Header */}
      <header className="news-header">
        <div className="container">
          <h1>TIN TỨC MỸ PHẨM</h1>
          <p>Cập nhật những xu hướng và kiến thức mới nhất trong ngành làm đẹp</p>
        </div>
      </header>

      {/* Featured News */}
      <section className="featured-news">
        <div className="container">
          <div className="news-banner">
            <span className="news-category">THÔNG BÁO</span>
            <h2>{featuredNews.title}</h2>
            <h3>{featuredNews.subtitle}</h3>
            <div className="news-meta">
              <span className="news-date">{featuredNews.date}</span>
              <span className="news-author">Biên tập viên: Nguyễn Thị Minh</span>
            </div>
          </div>
          
          <div className="featured-content">
            <img 
              src={featuredNews.image} 
              alt={featuredNews.title} 
              className="featured-image"
            />
            
            <div className="news-text">
              {featuredNews.content.map((paragraph, index) => (
                <p key={index}>{paragraph}</p>
              ))}
            </div>
            
            <div className="news-tags">
              {featuredNews.tags.map((tag, index) => (
                <span key={index} className="tag">{tag}</span>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Product News */}
      <section className="product-news">
        <div className="container">
          <div className="news-card">
            <div className="card-image">
              <img src={topProductsNews.image} alt={topProductsNews.title} />
            </div>
            
            <div className="card-content">
              <h3>{topProductsNews.title}</h3>
              <p className="news-summary">{topProductsNews.summary}</p>
              <p className="news-date">{topProductsNews.date}</p>
              
              <div className="news-details">
                <p>{topProductsNews.content}</p>
                
                <h4>Danh sách sản phẩm đề xuất:</h4>
                <ul>
                  {topProductsNews.products.map((product, index) => (
                    <li key={index}>{product}</li>
                  ))}
                </ul>
              </div>
              
              <div className="news-tags">
                {topProductsNews.tags.map((tag, index) => (
                  <span key={index} className="tag">{tag}</span>
                ))}
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Skincare Article */}
      <article className="skincare-article">
        <div className="container">
          <h2>{skinCareArticle.title}</h2>
          
          {skinCareArticle.sections.map((section, index) => (
            <div key={index} className="article-section">
              <h3>{section.heading}</h3>
              <p>{section.content}</p>
            </div>
          ))}
          
         
          
          <div className="article-tags">
            {skinCareArticle.tags.map((tag, index) => (
              <span key={index} className="tag">{tag}</span>
            ))}
          </div>
        </div>
      </article>

      {/* Related News */}
      <section className="related-news">
        <div className="container">
          <h2>TIN LIÊN QUAN</h2>
          
          <div className="related-grid">
            {relatedNews.map((news, index) => (
              <div key={index} className="related-card">
                <h3>{news.title}</h3>
                <p className="related-date">{news.date}</p>
                <p className="related-excerpt">{news.excerpt}</p>
                <button className="read-more">Đọc tiếp</button>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Newsletter Subscription */}
      <section className="newsletter">
        <div className="container">
          <h2>ĐĂNG KÝ NHẬN TIN</h2>
          <p>Nhận những bài viết mới nhất về mỹ phẩm và làm đẹp trực tiếp đến hộp thư của bạn</p>
          
          <form className="subscribe-form">
            <input type="email" placeholder="Email của bạn" required />
            <button type="submit">Đăng ký</button>
          </form>
        </div>
      </section>
    </div>
  );
};

export default TinTucPage;