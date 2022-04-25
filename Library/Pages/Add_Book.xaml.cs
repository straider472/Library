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
    /// Логика взаимодействия для Add_Book.xaml
    /// </summary>
    public partial class Add_Book : Page
    {
        public Add_Book()
        {
            InitializeComponent();
            //Вывод данных из бд в комбобоксы
            cb_genre.ItemsSource = Model.LibraryEntities.GetContext().Genres.ToList();
            cb_publication.ItemsSource = Model.LibraryEntities.GetContext().Publications.ToList();
        }

        //Возвращение на форму с книгами
        private void Go_Back(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        //Открытие модального окна с авторами
        private void Go_To_Add_Authors(object sender, RoutedEventArgs e)
        {
            var window = new Windows.Add_Authors_To_Book();
            window.ShowDialog();
        }
    }
}
