namespace DoAnKhoaCNTT.Models.Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LoaiNhom")]
    public partial class LoaiNhom
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LoaiNhom()
        {
            NhomSVChinhs = new HashSet<NhomSVChinh>();
            NhomSVs = new HashSet<NhomSV>();
        }

        [Key]
        [Column("LoaiNhom")]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long LoaiNhom1 { get; set; }

        [StringLength(50)]
        public string TenLoaiNhom { get; set; }

        public DateTime? NBD { get; set; }

        public DateTime? NKT { get; set; }

        public int? STC { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NhomSVChinh> NhomSVChinhs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NhomSV> NhomSVs { get; set; }
    }
}
