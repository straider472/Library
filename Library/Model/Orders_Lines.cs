//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Library.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Orders_Lines
    {
        public int Id_Order_Lines { get; set; }
        public int Id_Book { get; set; }
        public int Id_Reader { get; set; }
        public int Id_Order { get; set; }
    
        public virtual Books Books { get; set; }
        public virtual Orders Orders { get; set; }
        public virtual Readers Readers { get; set; }
    }
}
