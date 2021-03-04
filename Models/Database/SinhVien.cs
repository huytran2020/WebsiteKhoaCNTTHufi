namespace DoAnKhoaCNTT.Models.Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SinhVien")]
    public partial class SinhVien
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SinhVien()
        {
            DanhSachDeTaiDaDangKies = new HashSet<DanhSachDeTaiDaDangKy>();
            NhomSVs = new HashSet<NhomSV>();
            NhomSVs1 = new HashSet<NhomSV>();
            NhomSVChinhs = new HashSet<NhomSVChinh>();
            NhomSVChinhs1 = new HashSet<NhomSVChinh>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long MaSinhVien { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        public DateTime? DateBorn { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Address { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }

        public bool Status { get; set; }

        [StringLength(16)]
        public string Password { get; set; }

        public double Mark { get; set; }

        [Required]
        [StringLength(10)]
        public string MaKhoa { get; set; }

        public long? MaNhom { get; set; }

        [StringLength(50)]
        public string ChucVu { get; set; }

        public long? MaLoaiDeTai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DanhSachDeTaiDaDangKy> DanhSachDeTaiDaDangKies { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NhomSV> NhomSVs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NhomSV> NhomSVs1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NhomSVChinh> NhomSVChinhs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NhomSVChinh> NhomSVChinhs1 { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
