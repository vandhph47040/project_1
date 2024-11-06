<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng - Trang Thương Mại Điện Tử Cao Cấp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="css/style.css" rel="stylesheet" />
</head>
<style>
    .empty-cart {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 300px;
        /* Điều chỉnh chiều cao cho phù hợp */
        text-align: center;
    }
</style>

<body>

    <div class="container">
        <!-- Header (Giữ nguyên) -->
        <header class="py-3">
            <div class="container d-flex justify-content-between align-items-center">
                <a href="index.php" class="navbar-brand">ShopLogo</a>
                <form class="d-flex w-25">
                    <input class="form-control me-2 search-input" type="search" placeholder="Tìm kiếm sản phẩm..."
                        aria-label="Search">
                    <button class="btn btn-warning search-button" type="submit">Tìm kiếm</button>
                </form>
                <div class="header-links">
                    <a href="#" class="me-3"><i class="fas fa-sign-in-alt"></i> Đăng nhập</a>
                    <a href="#" class="me-3"><i class="fas fa-user-plus"></i> Đăng ký</a>
                    <a href="#"><i class="fas fa-shopping-cart"></i> Giỏ hàng</a>
                </div>
            </div>
        </header>

        <!-- Giỏ Hàng -->
        <div class="container py-5">
            <h2 class="text-center mb-4 fw-bold" style="color: #f15a29;">Giỏ Hàng Của Bạn</h2>
            <div class="row">
                <!-- Sản phẩm trong giỏ hàng -->
                <div class="col-md-12">
                    <?php
                    $cart = (isset($_SESSION['cart'])) ? $_SESSION['cart'] : [];
                    $quantity_item = count($cart);
                    $quantity_total = 0;
                    $price_total = 0;

                    if ($quantity_item > 0) {
                        foreach ($cart as $item) {
                            $stock_quantity = getAllQuantity($item['product_id']);
                            // var_dump($stock_quantity);
                            $img_c = $img_path . $item['product_image'];
                            if ($item['quantity'] > $stock_quantity) {
                                $item['quantity'] = $stock_quantity;
                            }
                            $product_price = (int)$item['product_price'] * (int)$item['quantity'];
                            $quantity_total += (int)$item['quantity'];
                            $price_total += $product_price;
                    ?>
                            <div class="cart-item mb-4 p-3 bg-light border rounded">
                                <div class="d-flex align-items-center">
                                    <img src="<?php echo $img_c ?>" alt="Product Image" class="me-3"
                                        style="width: 100px; height: 100px;">
                                    <div class="flex-grow-1">
                                        <h5 class="mb-1"><?php echo $item['product_name'] ?></h5>
                                        <p class="text-muted mb-1">
                                            <?php echo number_format($item['product_price'], 0, ',', '.') ?>đ</p>
                                        <form style="display: inline-flex;" action="index.php?act=update_cart" method="post">
                                            <input type="hidden" name="product_id" value="<?php echo $item['product_id'] ?>">
                                            <input type="hidden" name="update_quantity" value="1">
                                            <button type="button" class="btn btn-link px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown(); this.parentNode.submit();">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <input readonly id="form1" min="1" max="<?php echo $stock_quantity ?>" name="quantity"
                                                value="<?php echo $item['quantity'] ?>" type="number"
                                                class="form-control form-control-sm" onchange="this.form.submit();" />
                                            <button type="button" class="btn btn-link px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp(); this.parentNode.submit();">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </form>
                                    </div>
                                    <form action="index.php?act=delete_cart" method="post" class="btn btn-danger ms-3">
                                        <input type="hidden" name="product_id" value="<?php echo $item['product_id'] ?>">
                                        <input class="text-white fw-bold" type="submit" value="Xóa" name="btn_delete"
                                            style="background-color: transparent; border: none;">
                                    </form>
                                </div>
                            </div>
                    <?php
                        }
                    } else {
                        echo '<div class="d-flex justify-content-center">
                                <div class="alert text-center" style="max-width: 500px;" role="alert">
                                    <h4 class="alert-heading">Giỏ hàng của bạn đang trống!</h4>
                                    <p>Hãy thêm sản phẩm vào giỏ hàng để thực hiện thanh toán.</p>
                                    <hr>
                                    <p class="mb-0">Quay lại <a href="index.php" class="alert-link">Trang chủ</a> để mua sắm thêm.</p>
                                </div>
                            </div>';
                    }
                    ?>
                </div>

                <!-- Tổng thanh toán -->
                <div class="col-md-4">
                    <?php if ($quantity_item > 0) { ?>
                        <div class="bg-light p-3 border rounded">
                            <h5 class="mb-3">Tổng thanh toán</h5>
                            <p class="d-flex justify-content-between">
                                <span>Tổng số lượng sản phẩm:</span>
                                <span><?php echo $quantity_total ?></span>
                            </p>
                            <p class="d-flex justify-content-between">
                                <span>Tổng tiền:</span>
                                <span><?php echo number_format($price_total, 0, ',', '.') ?>đ</span>
                            </p>
                            <button class="btn btn-warning text-secondary fw-bold w-100 mt-3"
                                onclick="window.location.href='index.php?act=thanhtoan'">Thanh Toán</button>
                        </div>
                    <?php } ?>
                </div>
            </div>
        </div>

        <!-- Footer (Giữ nguyên) -->
        <footer class="py-4 ">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h5>Thông tin liên hệ</h5>
                        <p>Địa chỉ: FPT Polytecnich, Trịnh Văn Bô, Hà Nội</p>
                        <p>Email: vandhph47040@fpt.edu.vn hoặc manhldph47042@fpt.edu.vn
                        </p>
                        <p>SĐT: 0382681166 | 0327427463</p>
                    </div>
                    <div class="col-md-4">
                        <h5>Chính sách</h5>
                        <ul class="list-unstyled">
                            <li><a class="text-white" href="#">Chính sách bảo mật</a></li>
                            <li><a class="text-white" href="#">Chính sách đổi trả</a></li>
                            <li><a class="text-white" href="#">Chính sách thanh toán</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5>Kết nối với chúng tôi</h5>
                        <a href="#" class="me-2"><i style="border-radius: 50%; color: #0865ff; background: #FFFFFF;" class="fab fa-facebook"></i></a>
                        <a href="#" class="me-2"><i style="border-radius: 35%;color: #FFFFFF; background: linear-gradient(to right, 
                #8A3AB9, 
                #E95950, 
                #BC2A8D, 
                #FCCC63, 
                #FBAD50, 
                #CD486B, 
                #4C68D7);" class="fab fa-instagram"></i></a>
                        <a href="#" style="color: #1c96e8;" class="me-2"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
        </footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>