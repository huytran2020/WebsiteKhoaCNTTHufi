namespace DoAnKhoaCNTT.Models.Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LoaiDeTai")]
    public partial class LoaiDeTai
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LoaiDeTai()
        {
            DeTais = new HashSet<DeTai>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long MaLoai { get; set; }

        [StringLength(50)]
        public string TenLoai { get; set; }

        public int? STC { get; set; }

        public DateTime? NBD { get; set; }

        public DateTime? NKT { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DeTai> DeTais { get; set; }
    }
}
