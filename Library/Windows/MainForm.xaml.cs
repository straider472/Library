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
    /// Логика взаимодействия для MainForm.xaml
    /// </summary>
    public partial class MainForm : Window
    {
        public MainForm()
        {
            InitializeComponent();
            //Вывод данных о типе пользователя
            tb_current_user.Text = $"Вы вошли как {App.current_user.Types_Users.Name.Trim()}";

            //Заглушка для навигации по фрейму
            main_frame.Navigate(new Pages.Orders());
        }

        //Переход к странице с книгами
        private void Go_To_Books(object sender, RoutedEventArgs e)
        {
            main_frame.Navigate(new Pages.Books());
        }

        //Переход к заказам
        private void Go_To_Orders(object sender, RoutedEventArgs e)
        {
            main_frame.Navigate(new Pages.Orders());
        }

        //Кнопка выхода из аккаунта
        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы точно хотите выйти?\nВсе несохраненные данные будут потеряны!",
                "", MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {
                var Window = new MainWindow();
                Window.Show();
                Close();
            }
        }

        //Переход к читателям
        private void Go_To_Readers(object sender, RoutedEventArgs e)
        {
            main_frame.Navigate(new Pages.Readers());
        }
    }
}
