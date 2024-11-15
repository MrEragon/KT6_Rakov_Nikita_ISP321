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

namespace PetShop.Pages
{
    /// <summary>
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder er = new StringBuilder();
                if (string.IsNullOrEmpty(LoginBox.Text))
                {
                    er.AppendLine("Введите логин");
                }
                if (string.IsNullOrEmpty(PasswordTextBox.Password))
                {
                    er.AppendLine("Введите пароль");
                }
                if (er.Length > 0)
                {
                    MessageBox.Show(er.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (Data.KT6Entities.GetContext().Users.Any(d=> d.Login == LoginBox.Text && d.Password == PasswordTextBox.Password))
                {
                    var user = Data.KT6Entities.GetContext().Users.Where(d => d.Login == LoginBox.Text && d.Password == PasswordTextBox.Password).FirstOrDefault();
                    Classes.Manager.Users = user;
                    switch (user.Role.Name)
                    {
                        case "Администратор":
                            Classes.Manager.MainFrame.Navigate(new Pages.AdminPage());
                            break;
                        case "Менеджер":
                            Classes.Manager.MainFrame.Navigate(new Pages.ManagerPage());
                            break;
                        case "Клиент":
                            Classes.Manager.MainFrame.Navigate(new Pages.ClientPage());
                            break;
                    }
                }
            }
            catch (Exception)
            {

            }
        }

        private void QuestButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.QuestPage());
        }
    }
}
