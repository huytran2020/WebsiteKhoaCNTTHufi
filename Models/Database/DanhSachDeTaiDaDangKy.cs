namespace DoAnKhoaCNTT.Models.Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DanhSachDeTaiDaDangKy")]
    public partial class DanhSachDeTaiDaDangKy
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long MaDeTaiDaDangKi { get; set; }

        public long? MaSV1 { get; set; }

        [StringLength(50)]
        public string TenSV1 { get; set; }

        [StringLength(10)]
        public string MaDeTai { get; set; }

        [StringLength(500)]
        public string TenDeTai { get; set; }

        [StringLength(50)]
        public string TenLoaiDeTai { get; set; }

        public long? MaNhom { get; set; }

        [StringLength(10)]
        public string MaGVHD { get; set; }

        [StringLength(10)]
        public string MaKhoa { get; set; }

        [StringLength(50)]
        public string ChucVu { get; set; }

        public virtual DeTai DeTai { get; set; }

        public virtual GiaoVienHD GiaoVienHD { get; set; }

        public virtual Khoa Khoa { get; set; }

        public virtual SinhVien SinhVien { get; set; }
    }
}
