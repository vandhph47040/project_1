<style>
    .form-label {
        font-weight: 500;
        color: #495057;
    }

    .btn-primary {
        background-color: #f15a29;
        /* Màu cam cho nút */
        border-color: #f15a29;
    }

    .btn-primary:hover {
        background-color: #d94e1d;
        /* Màu cam đậm hơn khi hover */
        border-color: #d94e1d;
    }

    .text-primary {
        color: #f15a29 !important;
        /* Màu cam cho chữ "Thông Tin Tài Khoản" */
    }

    .card {
        background-color: #f9f9f9;
    }
</style>

<div class="container-fluid">
    <?php
    if (isset($_SESSION['account'])) {
        $account = $_SESSION['account'];
    }
    ?>
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="card shadow-lg" style="max-width: 600px; border-radius: 15px;">
                <div class="card-body p-5">
                    <h3 class="text-center mb-4 text-primary fw-bold">Thông Tin Tài Khoản</h3>
                    <?php if (is_array($_SESSION['account'])): ?>
                        <form action="index.php?act=update_taikhoan" method="POST" enctype="multipart/form-data">
                            <div class="form-group mb-3">
                                <label for="user" class="form-label">Tên Tài Khoản</label>
                                <input type="text" class="form-control" id="user" name="user"
                                    value="<?php echo $account['user'] ?>" required>
                            </div>
                            <div class="form-group mb-3">
                                <label for="pass" class="form-label">Mật Khẩu</label>
                                <input type="password" class="form-control" id="pass" name="pass"
                                    value="<?php echo $account['password'] ?>" readonly>
                            </div>
                            <div class="form-group mb-3">
                                <label for="avatar" class="form-label">Ảnh Đại Diện</label>
                                <div class="d-flex align-items-center">
                                    <input type="file" class="form-control me-3" id="avatar" name="avatar">
                                    <img src="<?php echo $account['avatar'] ?>" alt="Avatar" class="rounded-circle"
                                        style="width: 80px; height: 80px; object-fit: cover;">
                                </div>
                            </div>
                            <div class="form-group mb-3">
                                <label for="phone" class="form-label">Số Điện Thoại</label>
                                <input type="text" class="form-control" id="phone" name="phone"
                                    value="<?php echo $account['phone_number'] ?>">
                            </div>
                            <div class="form-group mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email"
                                    value="<?php echo $account['email'] ?>">
                            </div>
                            <div class="form-group mb-3">
                                <label for="address" class="form-label">Địa Chỉ</label>
                                <input type="text" class="form-control" id="address" name="address"
                                    value="<?php echo $account['address'] ?>">
                            </div>
                            <div class="text-center mt-4">
                                <input type="hidden" name="account_id" value="<?php echo $account['account_id'] ?>">

                                <input type="submit" class="btn btn-primary w-50 py-2" value="Cập Nhật" id="capnhat" name="capnhat">
                            </div>
                        </form>
                        <div class="text-center mt-3">
                            <a href="index.php" class="btn btn-secondary w-50 py-2">Quay Lại</a> <!-- Nút Quay Lại -->
                        </div>
                    <?php else: ?>
                        <div class="alert alert-danger text-center mt-3">Không tìm thấy thông tin tài khoản</div>
                    <?php endif; ?>
                    <?php if (isset($thongbao) && $thongbao): ?>
                        <div class="alert alert-success mt-3"><?php echo $thongbao; ?></div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>