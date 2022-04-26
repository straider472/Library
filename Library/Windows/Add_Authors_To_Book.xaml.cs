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
    /// Логика взаимодействия для Add_Authors_To_Book.xaml
    /// </summary>
    public partial class Add_Authors_To_Book : Window
    {
        public Add_Authors_To_Book()
        {
            InitializeComponent();
            //Привязка данных
            dt_authors.ItemsSource = Model.LibraryEntities.GetContext().Authors.ToList();
        }

        //Список выбранных авторов
        public static List<Model.Authors> current_authors = new List<Model.Authors>();

        //Добавление авторов к книге
        private void Bt_Add_Author_Book(object sender, RoutedEventArgs e)
        {
            //Заглушка
            string message = "Были выбраны следующие авторы:\n";
            if (current_authors.Count > 0)
            {
                foreach (var item in current_authors)
                {
                    string last_name = item.Last_Name != null ? item.Last_Name.Trim() : "";
                    message += $"{item.First_Name.Trim()} {last_name} {item.Middle_Name.Trim()}\n";
                }
                MessageBox.Show(message);
                //Передача списка авторов
                Pages.Add_Book.current_authors = current_authors;
                Close();
            }
            else
            {
                MessageBox.Show("Выберите хотя бы одного автора!", "", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        //Выбор автора
        private void Check_Author(object sender, RoutedEventArgs e)
        {
            current_authors.Add(dt_authors.SelectedItem as Model.Authors);
        }

        //Удаление автора
        private void Uncheck_Author(object sender, RoutedEventArgs e)
        {
            current_authors.Remove(dt_authors.SelectedItem as Model.Authors);
        }

        //Закрытие окна
        private void Go_Back(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
