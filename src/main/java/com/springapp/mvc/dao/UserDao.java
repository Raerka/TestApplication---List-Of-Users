package com.springapp.mvc.dao;

import com.springapp.mvc.model.User;
import java.util.List;

public interface UserDao {

    void addUser(User user);                          // Добавление в таблицу

    void removeUser(int id);                       // Удаление из таблицы

    void updateUser(User user);                       // Обновление данных

    User getUserById(int id);                      // Получение данных по Id

    List<User> getAllUsers();                      // Получение списка всех данных

    List<User> findUsersByName(String name);             // Поиск по Имени
}
