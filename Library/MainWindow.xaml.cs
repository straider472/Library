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

namespace Library
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        //Заглушка для проверки работы БД!
        private void bt_auto_Click(object sender, RoutedEventArgs e)
        {
            var context = new Model.LibraryEntities();
            var user = context.Users.FirstOrDefault(i => i.Login == "admi" && i.Password == "123");
            if (user != null)
            {
                MessageBox.Show("Успешная авторизация!");
            }
            else
            {
                MessageBox.Show("Такого пользователя нет!");
                MessageBox.Show("К сожалению!");
                MessageBox.Show(":(");
            }
        }
    }
}
