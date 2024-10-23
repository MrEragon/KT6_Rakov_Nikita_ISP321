//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PetShop.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.Order = new HashSet<Order>();
        }
    
        public string ProductArticle { get; set; }
        public int IDSupply { get; set; }
        public int IDUnits { get; set; }
        public int Cost { get; set; }
        public int MaxSale { get; set; }
        public int IDProducer { get; set; }
        public int IDProvider { get; set; }
        public int IDCategory { get; set; }
        public int Sale { get; set; }
        public int CountOnStorage { get; set; }
        public string Description { get; set; }
        public string PhotoName { get; set; }
        public byte[] PhotoPicture { get; set; }
    
        public virtual Category Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Order { get; set; }
        public virtual Producer Producer { get; set; }
        public virtual Provider Provider { get; set; }
        public virtual Supply Supply { get; set; }
        public virtual Units Units { get; set; }
    }
}
