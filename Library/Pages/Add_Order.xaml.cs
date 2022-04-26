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
            //Очистка листа
            list_books.Clear();
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

        //Возвращение к заказам
        private void Go_Back(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        //Формирование заказа
        private void Create_Order(object sender, RoutedEventArgs e)
        {
            var errors = new StringBuilder();
            if (list_books.Count == 0) errors.Append("Выберите хотя бы одну книгу");
            if (errors.Length <= 0)
            {
                //Добавление заказа
                var order = new Model.Orders
                { Id_Reader = (cb_readers.SelectedItem as Model.Readers).Id_Reader,
                    Id_User = App.current_user.Id_User,
                    Date_Inception = DateTime.Today,
                    Date_End = DateTime.Today.AddDays(14),
                    Count_Books = list_books.Count,
                    Status = true
                };
                Model.LibraryEntities.GetContext().Orders.Add(order);
                Model.LibraryEntities.GetContext().SaveChanges();
                //Добавление строк заказа
                foreach (var item in list_books)
                {
                    var order_lines = new Model.Orders_Lines
                    { Id_Book = item.Id_Book,
                        Id_Order = order.Id_Order
                    };
                    Model.LibraryEntities.GetContext().Orders_Lines.Add(order_lines);
                    Model.LibraryEntities.GetContext().SaveChanges();
                }
                MessageBox.Show("Заказ был успешно сформирован!");
                NavigationService.Navigate(new Pages.Orders());
            }
            else
            {
                MessageBox.Show($"Исправьте следующие ошибки:\n{errors}");
            }
        }
    }
}
