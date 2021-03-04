namespace DoAnKhoaCNTT.Models.Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("GiaoVienHD")]
    public partial class GiaoVienHD
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public GiaoVienHD()
        {
            DanhSachDeTaiDaDangKies = new HashSet<DanhSachDeTaiDaDangKy>();
            DeTais = new HashSet<DeTai>();
        }

        [Key]
        [StringLength(10)]
        public string MaGiaoVien { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        public DateTime? DateBorn { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Address { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }

        [StringLength(50)]
        public string Specialized { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DanhSachDeTaiDaDangKy> DanhSachDeTaiDaDangKies { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DeTai> DeTais { get; set; }
    }
}
