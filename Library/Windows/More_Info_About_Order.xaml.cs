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
using System.Windows.Shapes;

namespace Library.Windows
{
    /// <summary>
    /// Логика взаимодействия для More_Info_About_Order.xaml
    /// </summary>
    public partial class More_Info_About_Order : Window
    {
        public More_Info_About_Order(Model.Orders order)
        {
            InitializeComponent();
            current_order = order;

            //Вывод данных из БД
            tb_fio_reader.Text = $"Читатель: {order.Readers.First_Name.Trim()} {order.Readers.Middle_Name.Trim()}";
            tb_fio_user.Text = $"Библиотекарь: {order.Users.First_Name.Trim()} {order.Users.Middle_Name.Trim()}";
            tb_date_inception.Text = $"Дата выдачи: {order.Date_Inception.ToString("D")}";
            tb_date_end.Text = $"Дата возврата: {order.Date_End.ToString("D")}";
            tb_count_books.Text = $"Кол-во книг: {order.Count_Books.ToString()}";

            //Список книг, взятых пользователем
            var order_lines = Model.LibraryEntities.GetContext().Orders_Lines.Where(i => i.Id_Order == order.Id_Order).ToList();
            foreach (var item in order_lines)
            {
                tb_books.Text += $"{item.Books.Name}\n";
            }
        }

        // выбранный товар
        private static Model.Orders current_order;

        //Назад к заказам
        private void Back_To_Orders(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
