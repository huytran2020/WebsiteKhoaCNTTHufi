namespace DoAnKhoaCNTT.Models.Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long TenDN { get; set; }

        [Required]
        [StringLength(16)]
        public string MatKhau { get; set; }

        [StringLength(50)]
        public string ViTri { get; set; }

        public virtual SinhVien SinhVien { get; set; }
    }
}
