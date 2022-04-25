﻿using System;
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
using System.Data.Entity;

namespace Library.Pages
{
    /// <summary>
    /// Логика взаимодействия для Books.xaml
    /// </summary>
    public partial class Books : Page
    {
        public Books()
        {
            InitializeComponent();
            //Привязка данных
            dt_books.ItemsSource = Model.LibraryEntities.GetContext().Books.ToList();

        }
    }
}
