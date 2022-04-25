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
using System.Data.Entity;

namespace Library.Pages
{
    /// <summary>
    /// Логика взаимодействия для Books.xaml
    /// </summary>
    public partial class Books : Page
    {
        public Books()
        {
            InitializeComponent();
            //Привязка данных
            dt_books.ItemsSource = Model.LibraryEntities.GetContext().Books.ToList();

        }

        //Удаление книги из таблицы
        private void Bt_Delete_Book(object sender, RoutedEventArgs e)
        {
            var book = dt_books.SelectedItem as Model.Books;
            if (MessageBox.Show("Вы точно хотите удалить?", "", MessageBoxButton.YesNo, MessageBoxImage.Warning)
                == MessageBoxResult.Yes)
            {
                var delete_book = Model.LibraryEntities.GetContext().Books.FirstOrDefault(i =>
                                    i.Id_Book == book.Id_Book);
                Model.LibraryEntities.GetContext().Books.Remove(delete_book);
                Model.LibraryEntities.GetContext().SaveChanges();
                MessageBox.Show("Книга была успешно удалена!");
            }
            dt_books.ItemsSource = Model.LibraryEntities.GetContext().Books.ToList();
        }

        //Переход на страницу с добавление новой книги
        private void Bt_Add_Book(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.Add_Book());
        }
    }
}
