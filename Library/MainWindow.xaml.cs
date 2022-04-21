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

        //Авторизация
        private void Bt_Auto_Click(object sender, RoutedEventArgs e)
        {
            // данные с текстовых полей
            string login = tb_login.Text.Trim();
            string password = pb_password.Password.Trim();
            // строка для сбора ошибок
            var errors = new StringBuilder();
            //Обработка исключений
            if (login.Length == 0 || password.Length == 0) errors.Append("Заполните все поля!");

            if (errors.Length > 0) MessageBox.Show(errors.ToString());
            else
            {
                //Запрос к БД
                var user = Model.LibraryEntities.GetContext().Users.FirstOrDefault(i =>
                i.Login == login && i.Password == password);
                if (user != null)
                {
                    MessageBox.Show("Успешная авторизация!");
                }
                else
                {
                    MessageBox.Show("Такого пользователя нет!");
                }
            }
        }

        //Desktop
    }
}
