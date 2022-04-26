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
            cb_readers.ItemsSource = Model.LibraryEntities.GetContext().Readers.ToList();
        }
        //Список книг
        public static List<Model.Books> list_books = new List<Model.Books>();

        //Выбор книги
        private void Select_Book(object sender, RoutedEventArgs e)
        {
            if (list_books.Count < 3) list_books.Add(dt_books.SelectedItem as Model.Books);
            else
            {
                MessageBox.Show("Количество книг не должно быть более трёх!");
                list_books.Remove(dt_books.SelectedItem as Model.Books);
                count_books.Content = list_books.Count.ToString();
            }
            count_books.Content = list_books.Count.ToString();
        }

        //Удаление книги
        private void Delete_Book(object sender, RoutedEventArgs e)
        {
            list_books.Remove(dt_books.SelectedItem as Model.Books);
            count_books.Content = list_books.Count.ToString();
        }
    }
}
