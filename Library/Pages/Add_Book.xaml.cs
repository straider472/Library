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
        //Список выбранных авторов
        public static List<Model.Authors> current_authors = new List<Model.Authors>();


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

        //Добавление книги
        private void Add_Book_Click(object sender, RoutedEventArgs e)
        {
            //Проверка данных
            var errors = new StringBuilder();
            if (tb_name.Text.Length <= 0 || tb_ISBN.Text.Length <= 0 || tb_count_pages.Text.Length <= 0)
                errors.Append("Заполните все поля!");
            int count_pages;
            if (Int32.TryParse(tb_count_pages.Text, out count_pages ) == false)
                errors.Append("Кол-во страниц должно быть числом!");
            if (current_authors.Count <= 0)
                errors.Append("Вы не выбрали ни одного автора!");

            //Добавление
            if (errors.Length == 0)
            {
                //Логика добавления
                var id_genre = (cb_genre.SelectedItem as Model.Genres).Id_Genre;
                int id_publication = (cb_publication.SelectedItem as Model.Publications).Id_Publication;
                var book = new Model.Books
                { Name = tb_name.Text.Trim(),
                    ISBN = tb_ISBN.Text.Trim(),
                    Count_Pages = count_pages,
                    Id_Genre = id_genre,
                    Id_Publication = id_publication,
                    Status = true
                 };
                foreach (var item in current_authors)
                {
                    book.Authors.Add(item);
                }
                Model.LibraryEntities.GetContext().Books.Add(book);
                Model.LibraryEntities.GetContext().SaveChanges();
                MessageBox.Show("Книга была успешно добавлена!");
                NavigationService.Navigate(new Pages.Books());
            }
            else
            {
                var list_error = errors.ToString().Split(new char[] {'!'});
                MessageBox.Show($"Исправьте следующие ошибки:\n{string.Join("\n", list_error)}");
            }
        }
    }
}
