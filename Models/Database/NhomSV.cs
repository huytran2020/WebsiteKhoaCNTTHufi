namespace DoAnKhoaCNTT.Models.Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NhomSV")]
    public partial class NhomSV
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long MaNhom { get; set; }

        [StringLength(50)]
        public string TenLoaiDeTai { get; set; }

        [StringLength(10)]
        public string MaKhoaSV1 { get; set; }

        public long? MaSV1 { get; set; }

        [StringLength(50)]
        public string TenSV1 { get; set; }

        [StringLength(50)]
        public string ChucVuSV1 { get; set; }

        public long? MaSV2 { get; set; }

        [StringLength(50)]
        public string TenSV2 { get; set; }

        [StringLength(50)]
        public string ChucVuSV2 { get; set; }

        public bool? TrangThai { get; set; }

        public long? MaLoaiNhom { get; set; }

        [StringLength(10)]
        public string MaKhoaSV2 { get; set; }

        public virtual LoaiNhom LoaiNhom { get; set; }

        public virtual SinhVien SinhVien { get; set; }

        public virtual SinhVien SinhVien1 { get; set; }
    }
}
