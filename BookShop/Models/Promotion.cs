namespace Book_Shop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Promotion")]
    public partial class Promotion
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column(Order = 0)]
        public int PromoID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string Scope { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(180)]
        public string PromoItem { get; set; }

        [Key]
        [Column(Order = 3, TypeName = "date")]
        public DateTime StartDate { get; set; }

        [Key]
        [Column(Order = 4, TypeName = "date")]
        public DateTime EndDate { get; set; }

        [Key]
        [Column(Order = 5)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int DiscountAmt { get; set; }
    }
}
