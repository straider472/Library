using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Library.Pages
{
    /// <summary>
    /// Логика взаимодействия для Add_Order.xaml
    /// </summary>
    public partial class Add_Order : Page
    {
        public Add_Order()
        {
            InitializeComponent();
            //Привязка данных
            dt_books.ItemsSource = Model.LibraryEntities.GetContext().Books.ToList();
        }

        //Выбор книги
        private void Select_Book(object sender, RoutedEventArgs e)
        {

        }

        //Удаление книги
        private void Delete_Book(object sender, RoutedEventArgs e)
        {

        }
    }
}
