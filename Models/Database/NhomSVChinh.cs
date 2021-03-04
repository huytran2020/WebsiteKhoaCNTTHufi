namespace DoAnKhoaCNTT.Models.Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NhomSVChinh")]
    public partial class NhomSVChinh
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long MaNhom { get; set; }

        [StringLength(50)]
        public string TenLoaiDeTai { get; set; }

        public long? MaSv1 { get; set; }

        [StringLength(50)]
        public string TenSv1 { get; set; }

        [StringLength(10)]
        public string MaKhoaSv1 { get; set; }

        [StringLength(50)]
        public string ChucVuSv1 { get; set; }

        public long? MaSv2 { get; set; }

        [StringLength(50)]
        public string TenSv2 { get; set; }

        [StringLength(10)]
        public string MaKhoaSv2 { get; set; }

        [StringLength(50)]
        public string ChucVuSv2 { get; set; }

        public bool? TrangThai { get; set; }

        public long? MaLoaiNhom { get; set; }

        public virtual LoaiNhom LoaiNhom { get; set; }

        public virtual SinhVien SinhVien { get; set; }

        public virtual SinhVien SinhVien1 { get; set; }
    }
}
