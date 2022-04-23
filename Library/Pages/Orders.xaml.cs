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
    /// Логика взаимодействия для Orders.xaml
    /// </summary>
    public partial class Orders : Page
    {
        public Orders()
        {
            InitializeComponent();
            //Привязка данных
            dt_orders.ItemsSource = Model.LibraryEntities.GetContext().Orders.ToList();
        }

        //Больше информации о заказе
        private void Click_More_Info_About_Order(object sender, RoutedEventArgs e)
        {
            var order = dt_orders.SelectedItem as Model.Orders;
            var window = new Windows.More_Info_About_Order(order);
            window.ShowDialog();
        }

        //Удаление заказа
        private void Delete_Order(object sender, RoutedEventArgs e)
        {
            var order = dt_orders.SelectedItem as Model.Orders;
            if (MessageBox.Show("Вы точно хотите удалить?", "", MessageBoxButton.YesNo, MessageBoxImage.Warning)
                == MessageBoxResult.Yes)
            {
                var delete_order = Model.LibraryEntities.GetContext().Orders.FirstOrDefault(i =>
                                    i.Id_Order == order.Id_Order);
                Model.LibraryEntities.GetContext().Orders.Remove(delete_order);
                Model.LibraryEntities.GetContext().SaveChanges();
                MessageBox.Show("Заказ был успешно удалён!");
            }
            dt_orders.ItemsSource = Model.LibraryEntities.GetContext().Orders.ToList();
        }
    }
}
