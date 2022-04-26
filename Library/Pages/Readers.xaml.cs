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
    /// Логика взаимодействия для Readers.xaml
    /// </summary>
    public partial class Readers : Page
    {
        public Readers()
        {
            InitializeComponent();
            //Привязка данных
            dt_readers.ItemsSource = Model.LibraryEntities.GetContext().Readers.ToList();
        }

        //Переход на страницу с добавлением читателей
        private void Add_Reader_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.Add_Reader());
        }
    }
}
