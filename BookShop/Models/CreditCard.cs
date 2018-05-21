namespace Book_Shop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CreditCard")]
    public partial class CreditCard
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CardID { get; set; }

        public int UserID { get; set; }

        [Required]
        [MaxLength(50)]
        public byte[] FullName { get; set; }

        [Required]
        [StringLength(50)]
        public string CardNumber { get; set; }

        public DateTime ExpiryDate { get; set; }

        public int SecurityNumber { get; set; }
    }
}
