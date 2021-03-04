namespace DoAnKhoaCNTT.Models.Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LienHe")]
    public partial class LienHe
    {
        public int ID { get; set; }

        [Column(TypeName = "ntext")]
        public string Noidung { get; set; }

        public bool? Status { get; set; }
    }
}
