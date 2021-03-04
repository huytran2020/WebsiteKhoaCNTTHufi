namespace DoAnKhoaCNTT.Models.Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DeTai")]
    public partial class DeTai
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DeTai()
        {
            DanhSachDeTaiDaDangKies = new HashSet<DanhSachDeTaiDaDangKy>();
        }

        [Key]
        [StringLength(10)]
        public string MaDeTai { get; set; }

        [StringLength(10)]
        public string MaKhoa { get; set; }

        [StringLength(500)]
        public string TenDeTai { get; set; }

        [StringLength(500)]
        public string YeuCau { get; set; }

        [StringLength(250)]
        public string MucDich { get; set; }

        public long? MaLoai { get; set; }

        [StringLength(10)]
        public string MaGV { get; set; }

        public bool? TrangThai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DanhSachDeTaiDaDangKy> DanhSachDeTaiDaDangKies { get; set; }

        public virtual GiaoVienHD GiaoVienHD { get; set; }

        public virtual Khoa Khoa { get; set; }

        public virtual LoaiDeTai LoaiDeTai { get; set; }
    }
}
